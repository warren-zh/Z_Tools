use lopdf::{Document, Object, Dictionary};
use crate::utils::{create_object, ActionType};

pub fn uri_test_case(doc: &mut Document, uri: &str) -> lopdf::ObjectId {
    // 创建 URI 动作
    let action_obj_id = create_object(doc, ActionType::URI(uri.to_string()));

    // 构造注释区域：PDF 中的 Rect 格式为 [llx, lly, urx, ury]
    let rect = [50.0, 500.0, 250.0, 550.0];
    let rect_obj = Object::Array(rect.iter().map(|&v| Object::Real(v)).collect());

    // 构建链接注释字典
    let mut link_annot = Dictionary::new();
    link_annot.set("Type", "Annot");
    link_annot.set("Subtype", "Link");
    link_annot.set("Rect", rect_obj);
    // 设置边框为无边框，确保注释区域干净
    link_annot.set("Border", Object::Array(vec![
        Object::Integer(0),
        Object::Integer(0),
        Object::Integer(0),
    ]));
    link_annot.set("A", Object::Reference(action_obj_id));

    // 将注释对象添加到 PDF 对象中
    let annot_obj_id = doc.new_object_id();
    doc.objects.insert(annot_obj_id, Object::Dictionary(link_annot));

    let pages = doc.get_pages();
    if let Some((_, &page_1_id)) = pages.iter().next() {
        if let Some(Object::Dictionary(page_dict)) = doc.objects.get_mut(&page_1_id) {
            match page_dict.get_mut(b"Annots").ok() {
                Some(Object::Array(annots)) => {
                    annots.push(Object::Reference(annot_obj_id));
                }
                _ => {
                    page_dict.set("Annots", Object::Array(vec![Object::Reference(annot_obj_id)]));
                }
            }
        }
    }


    annot_obj_id
}
