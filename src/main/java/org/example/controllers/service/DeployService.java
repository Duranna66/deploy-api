package org.example.controllers.service;

import lombok.SneakyThrows;
import org.example.responses.Response;
import org.springframework.stereotype.Service;

@Service
public class DeployService {
    @SneakyThrows
    public Response startDeployScript(String name) {
        String path = "/src/main/java/org/example/scripts/deploy.sh";
        ProcessBuilder pb = new ProcessBuilder(path, name);
        Process p = pb.start();
        p.waitFor();
        for(var x : p.getInputStream().readAllBytes()) {
            System.out.print((char)x);
        }
        return Response.builder()
                .error(false)
                .msg("goood")
                .build();
    }
}
