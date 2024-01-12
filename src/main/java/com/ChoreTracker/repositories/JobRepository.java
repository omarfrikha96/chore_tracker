package com.ChoreTracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ChoreTracker.models.Job;
import com.ChoreTracker.models.User;

@Repository
public interface JobRepository extends CrudRepository<Job , Long> {
	List<Job> findAll();
	Job findByIdIs(Long id);
	List<Job> findAllByUsers(User user);
	List<Job> findByUsersNotContains(User user);
}
