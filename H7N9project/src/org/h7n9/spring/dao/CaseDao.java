package org.h7n9.spring.dao;

import java.util.List;

import org.h7n9.spring.entity.CaseInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CaseDao extends JpaRepository<CaseInfo, Integer> {

	public List<CaseInfo> findBySymptom(String symptom);
	
	public List<CaseInfo> findBySymptomLike(String symptom);

	public List<CaseInfo> findByBase(Integer base);

	public List<CaseInfo> findByManagement(Integer management);

	public List<CaseInfo> findByChannel(Integer channel);

	public List<CaseInfo> findByDefence(Integer defence);

	public List<CaseInfo> findByAnalysis(Integer analysis);

	public List<CaseInfo> findByFund(Integer fund);

	public List<CaseInfo> findByRationality(Integer rationality);

	public List<CaseInfo> findByExperience(Integer experience);
	
	@Query(value = "SELECT v.area,count(v.caseid) FROM	case_info v where v.confirmation = 1 GROUP BY v.area", nativeQuery = true)
	public List<Object[]> findGroupByArea();

	public List<Object[]> findByConfirmationAndSymptomLike(int i, String string);
}
