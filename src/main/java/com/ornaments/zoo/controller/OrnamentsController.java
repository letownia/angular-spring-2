package com.ornaments.zoo.controller;



import com.ornaments.zoo.model.MapFeature;
import com.ornaments.zoo.repository.MapFeatureRepository;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrnamentsController {

  @Autowired private MapFeatureRepository mapFeatureRepository;


  @GetMapping("/test")
  public ResponseEntity<String> test(){
    return new ResponseEntity<>("test", HttpStatus.OK);
  }

  @GetMapping(value = "/features", produces = MediaType.APPLICATION_JSON_VALUE)
  public ResponseEntity<List<MapFeature>> getFeatures(){
    return new ResponseEntity<>(
        StreamSupport.stream(mapFeatureRepository.findAll().spliterator(),false).collect(Collectors.toList()), HttpStatus.OK);
  }

}
