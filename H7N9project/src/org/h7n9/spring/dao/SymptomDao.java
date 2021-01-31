package org.h7n9.spring.dao;

import java.util.List;

import org.h7n9.spring.entity.SymptomInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SymptomDao extends JpaRepository<SymptomInfo, Integer> {

	public List<SymptomInfo> findByCodeIn(List<String> codes);
	
	public List<SymptomInfo> findByCodeIn(String[] codes);
	
	public SymptomInfo findByName(String name);
	
	@Query(value = "SELECT v.symptom,count(1) FROM case_info v where v.confirmation = 1 GROUP BY v.symptom HAVING count(1) > 1", nativeQuery = true)
	public List<Object[]> countSymptom();
	
	@Query(value = "select v1.symptom,v1.c, v2.c as c2 from (SELECT symptom, count(1) as c FROM case_info where confirmation = 1 group by symptom) v1 inner join (SELECT symptom, count(1) as c FROM case_info where confirmation = 0 group by symptom) v2 on  v1.symptom = v2.symptom", nativeQuery = true)
	public List<Object[]> contradiction();
	
}
