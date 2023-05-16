#[cfg(test)]
mod tests {
    use warp::http::StatusCode;
    use warp::test::request;
    use warp::Filter;

    #[tokio::test]
    async fn test_hello() {
        let hello = warp::path!("hello" / String).map(|name| format!("hello, {}", name));

        let response = request()
            .method("GET")
            .path("/hello/John")
            .reply(&hello)
            .await;

        assert_eq!(response.status(), StatusCode::OK);

        let body = std::str::from_utf8(response.body()).unwrap();
        assert_eq!(body, "hello, John");
    }
}
