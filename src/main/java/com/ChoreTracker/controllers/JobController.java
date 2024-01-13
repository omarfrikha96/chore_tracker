package com.ChoreTracker.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ChoreTracker.models.Job;
import com.ChoreTracker.models.User;
import com.ChoreTracker.services.JobService;
import com.ChoreTracker.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class JobController {
	@Autowired
	private JobService jobService;

	@Autowired
	private UserService userService;

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model, Job job) {
	 
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("jobs", jobService.all());
    	model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));


		return "dashboard.jsp";
	}
	
    @GetMapping("/jobs/{id}/join")
    public String borrowBook(@PathVariable("id") Long id, HttpSession session) {
    	if(session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Job job = jobService.findById(id);
    	job.setJoin(userService.findById((Long)session.getAttribute("userId")));
    	jobService.update(job);
    	
    	return "redirect:/dashboard";
    }
    	

	@GetMapping("/addJob")
	public String newJob(@ModelAttribute("job") Job job, HttpSession session, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
//		Long userId = (Long) session.getAttribute("userId");
		User user = userService.findById((Long)session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "new_job.jsp";
	}

	@PostMapping("/addJob")
	public String addNewJob(@Valid @ModelAttribute("job") Job job, BindingResult result, HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		if (result.hasErrors()) {
			return "new_job.jsp";
		} else {
			jobService.addJob(job);

			Long userId = (Long) session.getAttribute("userId");
			User user = userService.findById(userId);
			userService.updateUser(user);
			return "redirect:/dashboard";
		}
	}


	@GetMapping("/view/{id}")
	public String viewJob(@PathVariable("id") Long id, HttpSession session, Model model) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		Job job = jobService.findById(id);
		model.addAttribute("job", job);
		return "view_job.jsp";
	}

	@GetMapping("/edit/{id}")
	public String openEditJob(@PathVariable("id") Long id, HttpSession session, Model model) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		Job job = jobService.findById(id);
		model.addAttribute("job", job);
		return "edit_job.jsp";
	}

	@PostMapping("/edit/{id}")
	public String editJob(@PathVariable("id") Long id, @Valid @ModelAttribute("job") Job job, BindingResult result,
			HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");

		User user = userService.findById(userId);

		if (result.hasErrors()) {
			return "edit_job.jsp";
		} else {
			job.setLead(user);
			jobService.update(job);
			return "redirect:/dashboard";
		}
	}

	@DeleteMapping("/jobs/delete/{id}")
	public String deleteJob(@PathVariable("id") Long id, HttpSession session) {

		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}

		Job job = jobService.findById(id);
		jobService.deleteJob(job);

		return "redirect:/dashboard";
	}
}
