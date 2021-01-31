package org.h7n9.spring.controller;

import org.h7n9.spring.dao.SymptomDao;
import org.h7n9.spring.entity.SymptomInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Transactional(readOnly = true)
@RequestMapping("/symptom")
public class SymptomREST {

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public SymptomInfo addSymptom(@RequestParam("name") String name,
			@RequestParam("code") String code, Model model) {
		System.out.println(name);
		SymptomInfo symptomInfo = new SymptomInfo();
		symptomInfo.setCode(code);
		symptomInfo.setName(name);
		symptomDao.save(symptomInfo);
		return symptomInfo;
	}

	@Autowired
	SymptomDao symptomDao;

}
