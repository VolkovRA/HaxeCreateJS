package easeljs.display;

/**
 * The mode to use to determine which display objects to include.
 * 0-all, 1-respect mouseEnabled/mouseChildren, 2-only mouse opaque objects.
 * @author VolkovRA
 */
@:enum abstract ChildType(Int) to Int
{
	/**
	 * Evaluates all display objects.
	 */
	var ALL = 0;
	
	/**
	 * The mouseEnabled and MouseChildren:property properties will be respected.
	 */
	var ENABLED = 1;
	
	/**
	 * Additionally excludes display objects that do not have active mouse event listeners or a DisplayObject:cursor:property property.
	 * That is, only objects that would normally intercept mouse interaction will be included.
	 * This can significantly improve performance in some cases by reducing the number of display objects that need to be tested.
	 */
	var ACTIVE = 2;
}