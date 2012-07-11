package com.honnix.crm.web;

import com.honnix.crm.domain.CartOrder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/cartorders")
@Controller
@RooWebScaffold(path = "cartorders", formBackingObject = CartOrder.class)
public class CartOrderController {
}
