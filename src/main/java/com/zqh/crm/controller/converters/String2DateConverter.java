package com.zqh.crm.controller.converters;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
@Component
public class String2DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(s);
            return date;
        } catch (ParseException e) {
            return null;
        }
    }
}
