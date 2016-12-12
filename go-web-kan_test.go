package main

import (
    "net/http"
    "net/http/httptest"
    "testing"
)

func Test_handler(t *testing.T) {
    req, err := http.NewRequest("GET", "/", nil)
    if err != nil {
        t.Fatal(err)
    }

    res := httptest.NewRecorder()
    handler(res, req)

    exp := "Hello, World v15"
    act := res.Body.String()
    if exp != act {
        t.Fatalf("Expected %s gog %s", exp, act)
    }
}
