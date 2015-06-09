/**
 * Copyright (C) 2010-2015 eBusiness Information, Excilys Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed To in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package org.androidannotations.handler;

import javax.annotation.processing.ProcessingEnvironment;
import javax.lang.model.element.Element;

import org.androidannotations.annotations.NoTitle;
import org.androidannotations.holder.EActivityHolder;
import org.androidannotations.model.AnnotationElements;
import org.androidannotations.process.IsValid;

import com.sun.codemodel.JFieldRef;

@SuppressWarnings("deprecation")
public class NoTitleHandler extends BaseAnnotationHandler<EActivityHolder> {

	public NoTitleHandler(ProcessingEnvironment processingEnvironment) {
		super(NoTitle.class, processingEnvironment);
	}

	@Override
	public void validate(Element element, AnnotationElements validatedElements, IsValid valid) {
		validatorHelper.hasEActivity(element, validatedElements, valid);
	}

	@Override
	public void process(Element element, EActivityHolder holder) {
		JFieldRef noTitle = classes().WINDOW.staticRef("FEATURE_NO_TITLE");

		holder.getInitBody().invoke("requestWindowFeature").arg(noTitle);
	}
}
