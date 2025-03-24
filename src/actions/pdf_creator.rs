use std::io::BufWriter;
use std::fs::File;
use printpdf::*;

pub fn create_test_pdf() {
    let (doc, page1, layer1) = PdfDocument::new("Test", Mm(210.0), Mm(297.0), "Layer 1");
    let current_layer = doc.get_page(page1).get_layer(layer1);

    let font_file = File::open("./src/fonts/JetBrainsMono-Regular.ttf").expect("Could not open font file");
    let font = doc.add_external_font(font_file).expect("Could not add external font");

    current_layer.use_text("Hello, this is a test!", 36.0, Mm(10.0), Mm(250.0), &font);

    let file = File::create("test.pdf").expect("Cannot create test.pdf");
    let mut buf_writer = BufWriter::new(file);
    doc.save(&mut buf_writer).expect("Cannot save test.pdf");
}
