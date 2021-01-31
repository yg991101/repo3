package org.h7n9.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.h7n9.spring.dao.CaseDao;
import org.h7n9.spring.dao.QAndADao;
import org.h7n9.spring.dao.SymptomDao;
import org.h7n9.spring.entity.QandA;
import org.h7n9.spring.entity.SymptomInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Transactional(readOnly = true)
@RequestMapping
public class Questions {

	@Autowired
	private QAndADao dao;

	@Autowired
	private CaseDao caseDao;

	@Autowired
	private SymptomDao symptomDao;

	@RequestMapping("/questions")
	public String question() throws IOException {
		return "question/questions";
	}

	@RequestMapping("/questions/redundance")
	public String redundance(Model model) throws IOException {
		List<Object[]> count = symptomDao.countSymptom();
		for (Object[] obj : count) {
			String symptom = obj[0] + "";
			if (StringUtils.isNotEmpty(symptom)) {
				String symptomInfos = ",";
				List<SymptomInfo> symptoms = symptomDao.findByCodeIn(symptom
						.split(","));
				for (SymptomInfo symptomInfo : symptoms) {
					symptomInfos += ("," + symptomInfo.getName());
				}
				obj[0] = symptomInfos.substring(2);
			}
		}
		model.addAttribute("count", count);
		return "question/redundance";
	}

	@RequestMapping("/questions/contradiction")
	public String contradiction(Model model) throws IOException {
		List<Object[]> count = symptomDao.contradiction();
		for (Object[] obj : count) {
			String symptom = obj[0] + "";
			if (StringUtils.isNotEmpty(symptom)) {
				String symptomInfos = ",";
				List<SymptomInfo> symptoms = symptomDao.findByCodeIn(symptom
						.split(","));
				for (SymptomInfo symptomInfo : symptoms) {
					symptomInfos += ("," + symptomInfo.getName());
				}
				obj[0] = symptomInfos.substring(2);
			}
		}
		model.addAttribute("count", count);
		return "question/contradiction";
	}

	@RequestMapping(value = "/answers", method = RequestMethod.GET)
	public String answers() throws IOException {
		return "answers";
	}

	@RequestMapping(value = "/answers", method = RequestMethod.POST, produces = "text/html;charset=utf-8")
	@ResponseBody
	public String getanswers(@RequestParam("q") String q,
			HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		List<QandA> qanda = dao.findByQuestionLike(q);
		if (!qanda.isEmpty()) {
			return qanda.get(0).getAnswer();
		} else if (q.contains("地区")) {
			String s = "H7N9的案例分布：";
			List<Object[]> areas = caseDao.findGroupByArea();
			for (Object[] area : areas) {
				s += ("，" + area[0] + " " + area[1] + " 例");
			}
			s.replaceFirst("，", "");
			return s;
		} else {
			SymptomInfo info = symptomDao.findByName(q);
			if (info == null) {
				return "无解答";
			} else {
				// int size = caseDao.findBySymptomLike("%" + info.getCode() +
				// "%")
				// .size();
				// long all = caseDao.count();
				// return q
				// + "在所有的 "
				// + all
				// + " 个病例中出现了 "
				// + size
				// + " 次，占 "
				// + new BigDecimal(size * 100d / all).setScale(2,
				// BigDecimal.ROUND_HALF_UP).doubleValue() + "%";
				return StringUtils.isEmpty(info.getDescriptions()) ? "暂无此症状资料"
						: info.getDescriptions();
			}
		}
	}

	@RequestMapping("/learning")
	public String learning(Model model) throws IOException {
		List<SymptomInfo> symptoms = symptomDao.findAll();
		for (SymptomInfo s : symptoms) {
			int confirms = caseDao.findByConfirmationAndSymptomLike(1,
					"%" + s.getCode() + "%").size();
			s.setConfirm(confirms);
			int unconfirm = caseDao.findByConfirmationAndSymptomLike(0,
					"%" + s.getCode() + "%").size();
			s.setUnconfirm(unconfirm);
			s.setAll(confirms + unconfirm);
		}
		model.addAttribute("symptoms", symptoms);
		return "learning";
	}
}
