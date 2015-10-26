package com.hyonga.dictionary.service;

import com.hyonga.dictionary.domain.HeritageSearchCondition;
import com.hyonga.dictionary.domain.HeritageSearchResult;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HeritageServiceImpl implements IHeritageService {

    /** Logger object */
    private final Logger logger = LoggerFactory.getLogger(HeritageServiceImpl.class);
    /** Mybatis namespace */
    private static final String NAMESPACE = "com.hyonga.dictionary.dao.HeritageMapper";

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List<HeritageSearchResult> listHeritageSearchResult(HeritageSearchCondition condition) {
        List<HeritageSearchResult> lists = this.sqlSessionTemplate.selectList(NAMESPACE + ".searchHeritage", condition);
        return lists;
    }
}
