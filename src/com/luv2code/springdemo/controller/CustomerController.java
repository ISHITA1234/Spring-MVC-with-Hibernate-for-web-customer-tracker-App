package com.luv2code.springdemo.controller;
import java.util.concurrent.TimeUnit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.luv2code.springdemo.dao.CustomerDAO;
import com.luv2code.springdemo.entity.Customer;
import com.luv2code.springdemo.service.CustomerService;

@Controller
@RequestMapping(path = "/customer")
public class CustomerController {
	
	//need to inject customer service
	@Autowired
	private CustomerService customerService;
	
	//@RequestMapping("/list") //works
	@GetMapping("/list") //do not work
//	@PostMapping("/list")// works
	public String listCustomers(Model theModel)
	{
		
		//get customer from service
		List<Customer> theCustomers = customerService.getCustomers();
		//add the customers to model
		theModel.addAttribute("customers", theCustomers);
						
		return "list-customers"; //the jsp page
	}
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel)
	{
		//create new model attribute to bind data
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);
		System.out.println("bye bye");
		return "customer-form";
	}
	
	@GetMapping("/to_gallary")
	public String to_galary_method(String filePath) {
		//Pagla chulke ne
		System.out.println("cholo galary page e");
		return "gallary";
	}
	
	@GetMapping("/upload_gallary")
	public String upload_galary_method(String filePath) {
		//Pagla chulke ne
		System.out.println("galary r kaj shere firchi");
		/*
		try {
			TimeUnit.SECONDS.sleep(5);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		return "gallary";//"redirect:/customer/list";
	}
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer theCustomer)
	{
		//save customer in db using service
		customerService.saveCustomer(theCustomer);
		return "redirect:/customer/list";
	}
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int theId, Model theModel)
	{
		//get customer data from Service
		Customer theCustomer = customerService.getCustomer(theId);
		// set customer as model to pre-populate the form
		theModel.addAttribute("customer", theCustomer);
		//sent over to main form customer/list
		return "customer-form";
	}
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId)
	{
		//delete customer
		customerService.deleteCustomer(theId);
		return "redirect:/customer/list";
	}
	
}
