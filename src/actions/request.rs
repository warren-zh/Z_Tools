use crate::utils::ErrorHandler;
use reqwest;

#[derive(Debug)]
pub struct HttpResponse {
    pub status: reqwest::StatusCode,
    pub headers: reqwest::header::HeaderMap,
    pub body: String,
}

#[derive(Debug)]
pub struct HttpRequest {
    uri: String,
    method: String,
    cookie: Option<String>,
    header: Option<String>,
    body: Option<String>,
}

impl HttpRequest {
    pub fn new(uri: impl Into<String>, method: impl Into<String>) -> Self {
        Self {
            uri: uri.into(),
            method: method.into(),
            cookie: None,
            header: None,
            body: None,
        }
    }

    pub fn cookie(mut self, cookie: impl Into<String>) -> Self {
        self.cookie = Some(cookie.into());
        self
    }

    pub fn header(mut self, header: impl Into<String>) -> Self {
        self.header = Some(header.into());
        self
    }

    pub fn body(mut self, body: impl Into<String>) -> Self {
        self.body = Some(body.into());
        self
    }

}


pub async fn send_request(request: &HttpRequest) -> Result<HttpResponse, ErrorHandler> {
    let client = reqwest::Client::new();

    let req_builder = match request.method.as_str() {
        "GET" => client.get(&request.uri),
        "POST" => {
            let mut builder = client.post(&request.uri);
            if let Some(ref body) = request.body {
                builder = builder.body(body.clone());
            }
            builder
        },
        _ => return Err(ErrorHandler::new("Unsupported HTTP method".to_string())),
    };

    // Optionally add header and cookie if provided
    let req_builder = if let Some(ref header) = request.header {
        req_builder.header("Custom-Header", header)
    } else {
        req_builder
    };

    let req_builder = if let Some(ref cookie) = request.cookie {
        req_builder.header("Cookie", cookie)
    } else {
        req_builder
    };

    let response = req_builder
        .send()
        .await
        .map_err(|e| ErrorHandler::new(e.to_string()))?;

    let status = response.status();
    let headers = response.headers().clone();
    let body = response.text_with_charset("utf-8").await.map_err(|e| ErrorHandler::new(e.to_string()))?;

    Ok(HttpResponse { status, headers, body })
}
