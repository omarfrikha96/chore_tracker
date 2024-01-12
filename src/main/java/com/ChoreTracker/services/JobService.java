package com.ChoreTracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ChoreTracker.models.Job;
import com.ChoreTracker.models.User;
import com.ChoreTracker.repositories.JobRepository;

@Service
public class JobService {

	@Autowired
	private JobRepository jobRepo;
	@Autowired
	private UserService userService;
	
	public List<Job> allJobs(){
		return jobRepo.findAll();
	}
	
	public Job updateJob(Job job) {
		return jobRepo.save(job);
	}
	
	
	public Job addJob(Job job) {
		return jobRepo.save(job);
	}
	
	public void deleteJob(Job job) {
		jobRepo.delete(job);
	}
	
	public Job findById(Long id) {
		Optional<Job> optionalJob = jobRepo.findById(id);
		if(optionalJob.isPresent()) {
			return optionalJob.get();
		}else {
			return null;
		}
	}
}
