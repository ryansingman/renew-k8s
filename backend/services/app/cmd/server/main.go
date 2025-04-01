package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func pingHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("pong\n"))
}

func main() {
	r := mux.NewRouter()
	log.Println("Starting server on port 8080")

	// Routes consist of a path and a handler function.
	r.HandleFunc("/ping", pingHandler)

	// Bind to a port and pass our router in
	log.Fatal(http.ListenAndServe(":8080", r))
}
