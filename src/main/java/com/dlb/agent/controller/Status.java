package com.dlb.agent.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Status {
  @GetMapping("/hello")
  public String hello(){
    return "hello";
  }

  @GetMapping("/cpu")
  public String cpu() throws IOException {
    Process process =  Runtime.getRuntime().exec(new String[]{"sh", "status.sh"});
    BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
    String response = br.lines().collect(Collectors.joining("\n"));
    br.close();
    return response;
  }
}

