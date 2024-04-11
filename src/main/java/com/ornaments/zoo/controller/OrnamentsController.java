package com.ornaments.zoo.controller;



import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrnamentsController {
  @GetMapping("/")
  public ResponseEntity<String> getIndex(){
    return new ResponseEntity<>("test123", HttpStatus.OK);
  }

}
