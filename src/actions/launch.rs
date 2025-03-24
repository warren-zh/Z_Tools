use lopdf::{Document, Object};
use crate::utils::{create_object, ActionType};

pub fn launch_test_case(doc: &mut Document, launch_path: &str) -> lopdf::ObjectId {
    let action_obj_id = create_object(doc, ActionType::Launch(launch_path.to_string()));

    if let Ok(Object::Reference(root_id)) = doc.trailer.get(b"Root") {
        if let Some(Object::Dictionary(catalog)) = doc.objects.get_mut(&root_id) {
            catalog.set("OpenAction", Object::Reference(action_obj_id));
        }
    }

    action_obj_id
}
