use lopdf::{Document, Dictionary, Object, Stream};
use std::fmt::Debug;

#[macro_export]
macro_rules! print_variables {
    ($( $name:expr => $value:expr ),*) => {
        {
            let vars: &[(&str, &dyn Debug)] = &[
                $( ($name, &$value as &dyn Debug) ),*
            ];
            for (name, value) in vars {
                println!("{} = {:?}", name, value);
            }
        }
    };
}

pub enum ActionType {
    JavaScript(String),
    URI(String),
    Launch(String),
}

pub fn create_object(doc: &mut Document, action: ActionType) -> lopdf::ObjectId {
    let mut action_dict = Dictionary::new();
    action_dict.set("Type", "Action");

    match action {
        ActionType::JavaScript(code) => {
            let js_stream = Stream::new(Dictionary::new(), code.as_bytes().to_vec());
            let js_obj_id = doc.new_object_id();
            doc.objects.insert(js_obj_id, Object::Stream(js_stream));

            action_dict.set("S", "JavaScript");
            action_dict.set("JS", Object::Reference(js_obj_id));
        }
        ActionType::URI(uri) => {
            action_dict.set("S", "URI");
            action_dict.set("URI", Object::string_literal(uri));
            action_dict.set("NewWindow", Object::Boolean(false));
        }
        ActionType::Launch(path) => {
            action_dict.set("S", "Launch");
            action_dict.set("F", Object::string_literal(path));
        }
    }

    let action_obj_id = doc.new_object_id();
    doc.objects.insert(action_obj_id, Object::Dictionary(action_dict));
    action_obj_id
}

