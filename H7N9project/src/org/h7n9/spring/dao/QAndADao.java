package org.h7n9.spring.dao;

import java.util.List;

import org.h7n9.spring.entity.QandA;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QAndADao extends JpaRepository<QandA, String> {

	public List<QandA> findByQuestionLike(String question);

}
