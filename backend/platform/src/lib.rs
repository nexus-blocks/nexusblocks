extern crate serde;

#[ic_cdk::query]
fn greet(name: String) -> String {
    format!("Hello, {}!", name)
}

// need this to generate candid
ic_cdk::export_candid!();
