package com.henu.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.henu.model.Dict;

@Component("dictMapper")
public interface DictMapper {    
    public List<Dict> getAll();
}
