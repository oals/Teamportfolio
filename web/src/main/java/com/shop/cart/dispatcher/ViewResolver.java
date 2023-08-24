package com.shop.cart.dispatcher;

import lombok.Setter;

@Setter
public class ViewResolver {
	
	public String prefix;
	public String suffix;
	
	public String getView(String viewName) {
		// "index" => "/member/" + index + ".jsp"
		return prefix+viewName+suffix;
	}
	
}
