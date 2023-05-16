use warp::Filter;

#[tokio::main]
async fn main() {
    let hello = warp::path!("hello" / String).map(|name| format!("Howdy, {}", name));

    warp::serve(hello).run(([0, 0, 0, 0], 7000)).await;
}
