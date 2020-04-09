package createjs.utils;

import haxe.extern.Rest;
import js.lib.Function;

/**
 * Utility methods class.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Utility%20Methods.html
 * @author VolkovRA
 */
@:native("createjs")
extern class UtilityMethods 
{
	/**
	 * Wraps deprecated methods so they still be used, but throw warnings to developers.
	 * <code>obj.deprecatedMethod = Utility.deprecate("Old Method Name", obj._fallbackMethod);</code>
	 * The recommended approach for deprecated properties is:
	 * <code>
	 * try {
	 *     Obj    ect.defineProperties(object, {
	 *         readyOnlyProp: { get: Utility.deprecate("readOnlyProp", function() { return this.alternateProp; }) },
	 *         readWriteProp: {
	 *             get: Utility.deprecate("readOnlyProp", function() { return this.alternateProp; }),
	 *             set: Utility.deprecate("readOnlyProp", function(val) { this.alternateProp = val; })
	 *     });
	 * } catch (e) {}
	 * </code>
	 * @param	method	A method to call when the deprecated method is used. See the example for how.
	 * @param	name	The name of the method or property to display in the console warning. To deprecate properties.
	 * @return	If a fallbackMethod is supplied, returns a closure that will call the fallback method after logging the warning in the console.
	 */
	static public function deprecate(method:Function = null, name:String = null):Function;
	
	/**
	 * Sets up the prototype chain and constructor property for a new class.
	 * This should be called right after creating the class constructor.
	 * <code>
	 * function MySubClass() {}
	 * Utility.extend(MySubClass, MySuperClass);
	 * MySubClass.prototype.doSomething = function() { }
	 * 
	 * var foo = new MySubClass();
	 * console.log(foo instanceof MySuperClass); // true
	 * console.log(foo.prototype.constructor === MySubClass); // true
	 * </code>
	 * @param	subclass	The subclass.
	 * @param	superclass	The superclass to extend.
	 * @return	Returns the subclass's new prototype.
	 */
	static public function extend(subclass:Function, superclass:Function):Function;
	
	/**
	 * Finds the first occurrence of a specified value searchElement in the passed in array, and returns the index of that value.
	 * Returns -1 if value is not found.
	 * <code>var i = createjs.indexOf(myArray, myElementToFind);</code>
	 * @param	array	Array to search for searchElement.
	 * @param	value	Element to find in array.
	 * @return	The first index of searchElement in array.
	 */
	static public function indexOf(array:Array<Dynamic>, value:Dynamic):Int;
	
	/**
	 * Promotes any methods on the super class that were overridden, by creating an alias in the format prefix_methodName.
	 * It is recommended to use the super class's name as the prefix. An alias to the super class's constructor is always added
	 * in the format prefix_constructor. This allows the subclass to call super class methods without using function.call,
	 * providing better performance.
	 * 
	 * For example, if MySubClass extends MySuperClass, and both define a draw method, then calling promote(MySubClass,
	 * "MySuperClass") would add a MySuperClass_constructor method to MySubClass and promote the draw method on MySuperClass
	 * to the prototype of MySubClass as MySuperClass_draw.
	 * 
	 * This should be called after the class's prototype is fully defined.
	 * <code>
	 * function ClassA(name) {
	 *     this.name = name;
	 * }
	 * ClassA.prototype.greet = function() {
	 *     return "Hello "+this.name;
	 * }
	 * 
	 * function ClassB(name, punctuation) {
	 *     this.ClassA_constructor(name);
	 *     this.punctuation = punctuation;
	 * }
	 * createjs.extend(ClassB, ClassA);
	 * ClassB.prototype.greet = function() {
	 *     return this.ClassA_greet()+this.punctuation;
	 * }
	 * createjs.promote(ClassB, "ClassA");
	 * 
	 * var foo = new ClassB("World", "!?!");
	 * console.log(foo.greet()); // Hello World!?!
	 * </code>
	 * @param	subclass	The class to promote super class methods on.
	 * @param	prefix		The prefix to add to the promoted method names. Usually the name of the superclass.
	 * @return	Returns the subclass.
	 */
	static public function promote(subclass:Function, prefix:String):Function;
	
	/**
	 * A function proxy for methods.
	 * By default, JavaScript methods do not maintain scope, so passing a method as a callback will result in the
	 * method getting called in the scope of the caller. Using a proxy ensures that the method gets called in the correct scope.
	 * 
	 * Additional arguments can be passed that will be applied to the function when it is called.
	 * <code>
	 * myObject.addEventListener("event", proxy(myHandler, this, arg1, arg2));
	 * 
	 * function myHandler(arg1, arg2) {
	 *     // This gets called when myObject.myCallback is executed.
	 * }
	 * </code>
	 * @param	method	The function to call.
	 * @param	scope	The scope to call the method name on.
	 * @param	arg		Arguments that are appended to the callback for additional params.
	 */
	static public function proxy(method:Function, scope:Dynamic, arg:Rest<Dynamic>):Void;
}