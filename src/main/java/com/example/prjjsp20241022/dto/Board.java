package com.example.prjjsp20241022.dto;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class Board {
    private Integer id;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime inserted;
}
