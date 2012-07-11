package com.honnix.crm.web;

import com.honnix.crm.domain.LineItem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lineitems")
@Controller
@RooWebScaffold(path = "lineitems", formBackingObject = LineItem.class)
public class LineItemController {
}
