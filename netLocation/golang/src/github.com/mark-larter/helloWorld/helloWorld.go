package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello world.")
}

func main() {
	// Set handlers.
	http.HandleFunc("/", handler)

	// Start http server.
	fmt.Println("Starting http server")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
 		log.Panic(err)
	}
}
