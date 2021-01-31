package org.h7n9.spring.controller;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.h7n9.spring.dao.CaseDao;
import org.h7n9.spring.dao.SymptomDao;
import org.h7n9.spring.entity.CaseInfo;
import org.h7n9.spring.entity.SymptomInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Transactional(readOnly = true)
@RequestMapping("/cases")
public class CaseController {

	@RequestMapping
	public String caselist(
			@RequestParam(value = "page", defaultValue = "0") int pageNumber,
			Model model) {
		Pageable pageable = new PageRequest(pageNumber, 10, new Sort(new Order(
				Direction.DESC, "infodate")));
		Page<CaseInfo> pages = caseDao.findAll(pageable);
		List<CaseInfo> infos = pages.getContent();
		for (CaseInfo caseInfo : infos) {
			if (StringUtils.isNotEmpty(caseInfo.getSymptom())) {
				String symptomInfos = ",";
				List<SymptomInfo> symptoms = symptomDao.findByCodeIn(caseInfo
						.getSymptom().split(","));
				for (SymptomInfo symptomInfo : symptoms) {
					symptomInfos += ("," + symptomInfo.getName());
				}
				caseInfo.setSymptomString(symptomInfos.substring(2));
			}
		}
		model.addAttribute("pages", pages);
		return "cases";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addCase(Model model) {
		model.addAttribute("symptoms", symptomDao.findAll());
		return "add_case";
	}
	
	@RequestMapping(value = "/evaluate", method = RequestMethod.GET)
	public String evaluateCase(Model model) {
		model.addAttribute("symptoms", symptomDao.findAll());
		return "evaluate_case";
	}
	
	@RequestMapping(value = "/evaluate", method = RequestMethod.POST)
	public String evaluateCaseSave(
			@RequestParam("symptom") String[] symptom,
			@RequestParam("base") Integer base,
			@RequestParam("management") Integer management,
			@RequestParam("channel") Integer channel,
			@RequestParam("experience") Integer experience,
			@RequestParam("rationality") Integer rationality,
			@RequestParam("fund") Integer fund,
			@RequestParam("analysis") Integer analysis,
			@RequestParam("defence") Integer defence, Model model) {
		String symptoms = StringUtils.join(symptom, ",");
		List<CaseInfo> infos = caseDao.findBySymptom(symptoms);
		if (infos.size() == 0) {
			infos = caseDao.findBySymptomLike(symptoms);
		}
		String ids = getIds(infos);
		model.addAttribute("m1", ids);
		
		infos = caseDao.findByBase(base);
		model.addAttribute("m2", getIds(infos));
		
		infos = caseDao.findByManagement(management);
		model.addAttribute("m3", getIds(infos));
		
		infos = caseDao.findByChannel(channel);
		model.addAttribute("m4", getIds(infos));
		
		infos = caseDao.findByExperience(experience);
		model.addAttribute("m5", getIds(infos));
		
		infos = caseDao.findByRationality(rationality);
		model.addAttribute("m6", getIds(infos));
		
		infos = caseDao.findByFund(fund);
		model.addAttribute("m7", getIds(infos));
		
		infos = caseDao.findByAnalysis(analysis);
		model.addAttribute("m8", getIds(infos));
		
		infos = caseDao.findByDefence(defence);
		model.addAttribute("m9", getIds(infos));
		
		return "evaluate_result";
	}

	private String getIds(List<CaseInfo> infos) {
		String[] ids = new String[infos.size()];
		for (int i = 0; i < infos.size(); i++) {
			ids[i] = infos.get(i).getCaseid() + "";
		}
		return StringUtils.join(ids, ",");
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addCaseSave(@RequestParam("name") String name,
			@RequestParam("gender") String gender,
			@RequestParam("symptom") String[] symptom,
			@RequestParam("confirmation") int confirmation,
			@RequestParam("area") String area,
			@RequestParam("age") Integer age,
			@RequestParam("base") Integer base,
			@RequestParam("management") Integer management,
			@RequestParam("channel") Integer channel,
			@RequestParam("experience") Integer experience,
			@RequestParam("rationality") Integer rationality,
			@RequestParam("fund") Integer fund,
			@RequestParam("analysis") Integer analysis,
			@RequestParam("defence") Integer defence, Model model) {
		CaseInfo caseInfo = new CaseInfo();
		caseInfo.setConfirmation(confirmation);
		caseInfo.setGender(gender);
		caseInfo.setInfodate(new Date());
		caseInfo.setName(name);
		caseInfo.setArea(area);
		caseInfo.setAge(age + "");
		if(confirmation > 0) {
			caseInfo.setBase(base);
			caseInfo.setManagement(management);
			caseInfo.setChannel(channel);
			caseInfo.setExperience(experience);
			caseInfo.setRationality(rationality);
			caseInfo.setFund(fund);
			caseInfo.setAnalysis(analysis);
			caseInfo.setDefence(defence);
			caseInfo.setSum(base + management + channel + experience + rationality
					+ fund + analysis + defence + 35);
		}
		String symptoms = StringUtils.join(symptom, ",");
		caseInfo.setSymptom(symptoms);
		caseDao.save(caseInfo);
		return "redirect:/cases";
	}
	
	@RequestMapping(value = "/analytics", method = RequestMethod.GET)
	public String analytics(Model model) {
		List<Object[]> areaStats = caseDao.findGroupByArea();
		model.addAttribute("areaStats", areaStats);
		return "analytics";
	}
	

	@Autowired
	CaseDao caseDao;

	@Autowired
	SymptomDao symptomDao;
}
