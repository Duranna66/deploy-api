package org.example.controllers;

import lombok.AllArgsConstructor;
import org.example.controllers.service.DeployService;
import org.example.responses.Response;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/platform")
@AllArgsConstructor
public class DeployController {
    private DeployService deployService;

    @GetMapping("/deploy")
    public Response deploy(@RequestParam("name") String name) {
        return deployService.startDeployScript(name);
    }
}
