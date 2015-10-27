package com.hyonga.dictionary.service;

import com.hyonga.dictionary.common.HeritageSearchBasic;
import com.hyonga.dictionary.domain.*;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface IHeritageService {

    public List<HeritageSearchResult> listHeritageSearchResult(HeritageSearchCondition condition);

    public HeritageSearchEntryUCIResult getHeritageSearchEntryUCIResult(String entryIdx);

    public List<HeritageSearchRelations> listHeritageSearchRelations(Map<String, Object> listIdx);

    public HeritageSearchEntry getHeritageSearchEntry(String entryIdx);

    public List<Object> listHeritageSearchInformations(String entryIdx);

    public HeritageSearchBasic getHeritageSearchBasic(String entryIdx);

}
