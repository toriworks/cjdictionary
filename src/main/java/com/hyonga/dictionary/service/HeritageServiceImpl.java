package com.hyonga.dictionary.service;

import com.hyonga.dictionary.common.HeritageSearchBasic;
import com.hyonga.dictionary.domain.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public HeritageSearchEntryUCIResult getHeritageSearchEntryUCIResult(String entryIdx) {
        HeritageSearchEntryUCIResult heritageSearchEntryUCIResult = this.sqlSessionTemplate.selectOne(NAMESPACE + ".searchHeritageEntryUCI", entryIdx);
        return heritageSearchEntryUCIResult;
    }

    @Override
    public List<HeritageSearchRelations> listHeritageSearchRelations(Map<String, Object> listIdx) {
        List<HeritageSearchRelations> lists = this.sqlSessionTemplate.selectList(NAMESPACE + ".searchHeritageRelations", listIdx);
        return lists;
    }

    @Override
    public HeritageSearchEntry getHeritageSearchEntry(String entryIdx) {
        HeritageSearchEntry heritageSearchEntry = this.sqlSessionTemplate.selectOne(NAMESPACE + ".searchHeritageEntry", entryIdx);
        return heritageSearchEntry;
    }

    @Override
    public List<Object> listHeritageSearchInformations(String entryIdx) {
        return this.sqlSessionTemplate.selectList(NAMESPACE + ".selectHeritageInformation", entryIdx);
    }

    @Override
    public HeritageSearchBasic getHeritageSearchBasic(String entryIdx) {
        return this.sqlSessionTemplate.selectOne(NAMESPACE + ".searchHeritageBasic", entryIdx);
    }

}
