package com.hyonga.dictionary.service;

import com.hyonga.dictionary.domain.HeritageSearchCondition;
import com.hyonga.dictionary.domain.HeritageSearchResult;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IHeritageService {

    public List<HeritageSearchResult> listHeritageSearchResult(HeritageSearchCondition condition);

}
