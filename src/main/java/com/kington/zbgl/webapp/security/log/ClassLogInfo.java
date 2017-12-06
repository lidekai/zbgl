/**
 * 
 */
package com.kington.zbgl.webapp.security.log;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author Van Cheng
 *
 */
@Target(ElementType.TYPE)  
@Retention(RetentionPolicy.RUNTIME)  
@Documented
@Inherited
public @interface ClassLogInfo {
	public String name() default "";
}
