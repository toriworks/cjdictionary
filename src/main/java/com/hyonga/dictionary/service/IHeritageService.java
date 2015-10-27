package com.hyonga.dictionary.service;

import com.hyonga.dictionary.domain.HeritageSearchBasic;
import com.hyonga.dictionary.domain.*;

import java.util.List;
import java.util.Map;

public interface IHeritageService {

    public List<HeritageSearchResult> listHeritageSearchResult(HeritageSearchCondition condition);

    public HeritageSearchEntryUCIResult getHeritageSearchEntryUCIResult(String entryIdx);

    public List<HeritageSearchRelations> listHeritageSearchRelations(Map<String, Object> listIdx);

    public HeritageSearchEntry getHeritageSearchEntry(String entryIdx);

    public List<Object> listHeritageSearchInformations(String entryIdx);

    public List<HeritageSearchBasic> listHeritageSearchBasic(String entryIdx);

}
