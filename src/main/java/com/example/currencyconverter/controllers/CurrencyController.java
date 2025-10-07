package com.example.currencyconverter.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
@RequestMapping("/currency")
public class CurrencyController {

    private final Random random = new Random();

    private double getRandomRate(){
        double min = 10.50;
        double max = 12.00;
        return min + (max - min) * random.nextDouble();
    }

    @GetMapping("/randomcurrency")
    public Double getRandomCurrency(){
        return getRandomRate();
    }
}
