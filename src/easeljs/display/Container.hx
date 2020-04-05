package easeljs.display;

import js.html.CanvasRenderingContext2D;

/**
 * A Container is a nestable display list that allows you to work with compound display elements.
 * For example you could group arm, leg, torso and head Bitmap instances together into a Person Container, and
 * transform them as a group, while still being able to move the individual parts relative to each other.
 * Children of containers have their transform and alpha properties concatenated with their parent Container.
 * 
 * For example, a Shape with x=100 and alpha=0.5, placed in a Container with x=50 and alpha=0.7 will be rendered
 * to the canvas at x=150 and alpha=0.35. Containers have some overhead, so you generally shouldn't create a
 * Container to hold a single child.
 * <code>
 * var container = new Container();
 * container.addChild(bitmapInstance, shapeInstance);
 * container.x = 100;
 * </code>
 * 
 * EVENTS
 * Event.TICK				Dispatched on each display object on a stage whenever the stage updates. This occurs immediately before the
 * 							rendering (draw) pass. When update is called, first all display objects on the stage dispatch the tick event,
 * 							then all of the display objects are drawn to stage. Children will have their Tick:event event dispatched in
 * 							order of their depth prior to the event being dispatched on their parent.
 * 
 * Event.ADDED				Dispatched when the display object is added to a parent container.
 * 
 * Event.REMOVED			Dispatched when the display object is removed from its parent container.
 * 
 * MouseEvent.CLICK			Dispatched when the user presses their left mouse button and then releases it while over the display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.DBL_CLICK		Dispatched when the user double clicks their left mouse button over this display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_DOWN	Dispatched when the user presses their left mouse button over the display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.MOUSE_OUT		Dispatched when the user's mouse leaves this display object. This event must be enabled using enableMouseOver.
 * 							See also rollout. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_OVER	Dispatched when the user's mouse enters this display object. This event must be enabled using enableMouseOver.
 * 							See also rollover. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.PRESS_MOVE	After a mousedown occurs on a display object, a pressmove event will be generated on that object whenever the
 * 							mouse moves until the mouse press is released. This can be useful for dragging and similar operations.
 * 							Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 							pressed (e.g. during a pressmove event), a pressmove event is still generated. However since it is no longer
 * 							in the display list, the event can not bubble. This means that previous ancestors (parent containers) will
 * 							not receive the event, and therefore can not re-dispatch it. If you intend to listen for pressup or pressmove
 * 							on a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.PRESS_UP		After a mousedown occurs on a display object, a pressup event will be generated on that object when that mouse
 * 							press is released. This can be useful for dragging and similar operations.
 * 							Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 							pressed (e.g. during a pressmove event), a pressup event is still generated. However since it is no longer in
 * 							the display list, the event can not bubble. This means that previous ancestors (parent containers) will not
 * 							receive the event, and therefore can not re-dispatch it. If you intend to listen for pressmove or pressup on
 * 							a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.ROLL_OVER		This event is similar to mouseover, with the following differences: it does not bubble, and it considers
 * 							Container instances as an aggregate of their content. This event must be enabled using enableMouseOver. See
 * 							the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.ROLL_OUT		This event is similar to mouseout, with the following differences: it does not bubble, and it considers Container
 * 							instances as an aggregate of their content. This event must be enabled using enableMouseOver. See the MouseEvent
 * 							class for a listing of event properties.
 * 	
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Container.html
 * @author VolkovRA
 */
@:native("createjs.Container")
extern class Container extends DisplayObject 
{
	/**
	 * Create a new Container.
	 */
	public function new();
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The array of children in the display list.
	 * You should usually use the child management methods such as addChild, removeChild, swapChildren,
	 * etc, rather than accessing this directly, but it is included for advanced uses.
	 * Default: null
	 */
	public var children:Array<DisplayObject>;
	
	/**
	 * Returns the number of children in the container.
	 */
	public var numChildren(default, null):Int;
	
	/**
	 * Indicates whether the children of this container are independently enabled for mouse/pointer interaction.
	 * If false, the children will be aggregated under the container - for example, a click on a child shape
	 * would trigger a click event on the container.
	 * Default: true
	 */
	public var mouseChildren:Bool;
	
	/**
	 * If false, the tick will not be propagated to children of this Container.
	 * This can provide some performance benefits. In addition to preventing the Event.TICK event from being dispatched, it will also prevent tick related updates on some display objects (ex. Sprite & MovieClip frame advancing, DOMElement visibility handling).
	 * Default: true
	 */
	public var tickChildren:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Adds a child to the top of the display list.
	 * <code>container.addChild(bitmapInstance);</code>
	 * 
	 * You can also add multiple children at once:
	 * <code>container.addChild(bitmapInstance, shapeInstance, textInstance);</code>
	 * @param	child	The display object to add.
	 * @return	The child that was added, or the last child if multiple children were added.
	 */
	@:overload(function(child1:DisplayObject, child2:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, child9:DisplayObject):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, child9:DisplayObject, child10:DisplayObject):DisplayObject{})
	public function addChild(child:DisplayObject):DisplayObject;
	
	/**
	 * Adds a child to the display list at the specified index, bumping children at equal or greater indexes up one, and setting its parent to this Container.
	 * <code>addChildAt(child1, index);</code>
	 * 
	 * You can also add multiple children, such as:
	 * <code>addChildAt(child1, child2, ..., index);</code>
	 * 
	 * The index must be between 0 and numChildren. For example, to add myShape under otherShape in the display list, you could use:
	 * <code>container.addChildAt(myShape, container.getChildIndex(otherShape));</code>

	 * This would also bump otherShape's index up by one. Fails silently if the index is out of range.
	 * @param	child	The display object to add.
	 * @param	index	The index to add the child at.
	 * @return	Returns the last child that was added, or the last child if multiple children were added.
	 */
	@:overload(function(child1:DisplayObject, child2:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, child9:DisplayObject, index:Int):DisplayObject{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, child9:DisplayObject, child10:DisplayObject, index:Int):DisplayObject{})
	public function addChildAt(child:DisplayObject, index:Int):DisplayObject;
	
	/**
	 * Returns true if the specified display object either is this container or is a descendent (child, grandchild, etc) of this container.
	 * @param	child	The DisplayObject to be checked.
	 * @return	true if the specified display object either is this container or is a descendent.
	 */
	public function contains(child:DisplayObject):Bool;
	
	/**
	 * Returns the child at the specified index.
	 * <code>container.getChildAt(2);</code>
	 * @param	index	The index of the child to return.
	 * @return	The child at the specified index. Returns null if there is no child at the index.
	 */
	public function getChildAt(index:Int):DisplayObject;
	
	/**
	 * Returns the child with the specified name.
	 * @param	name	The name of the child to return.
	 * @return	The child with the specified name.
	 */
	public function getChildByName(name:String):DisplayObject;
	
	/**
	 * Returns the index of the specified child in the display list, or -1 if it is not in the display list.
	 * <code>var index = container.getChildIndex(child);</code>
	 * @param	child	The child to return the index of.
	 * @return	The index of the specified child. -1 if the child is not found.
	 */
	public function getChildIndex(child:DisplayObject):Int;
	
	/**
	 * Use the numChildren property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getNumChildren():Int;
	
	/**
	 * Returns an array of all display objects under the specified coordinates that are in this container's display list.
	 * This routine ignores any display objects with mouseEnabled set to false. The array will be sorted in order of visual
	 * depth, with the top-most display object at index 0. This uses shape based hit detection, and can be an expensive
	 * operation to run, so it is best to use it carefully. For example, if testing for objects under the mouse, test on
	 * tick (instead of on stagemousemove), and only if the mouse's position has changed.
	 * This method accounts for both hitArea and mask.
	 * @param	x		The x position in the container to test.
	 * @param	y		The y position in the container to test.
	 * @param	mode	The mode to use to determine which display objects to include.
	 * @return	An Array of DisplayObjects under the specified coordinates.
	 */
	public function getObjectsUnderPoint(x:Float, y:Float, mode:ChildType = ChildType.ALL):Array<DisplayObject>;
	
	/**
	 * Removes all children from the display list.
	 * <code>container.removeAllChildren();</code>
	 */
	public function removeAllChildren():Void;
	
	/**
	 * Removes the specified child from the display list.
	 * Note that it is faster to use removeChildAt() if the index is already known.
	 * <code>container.removeChild(child);</code>
	 * 
	 * You can also remove multiple children:
	 * <code>removeChild(child1, child2, ...);</code>
	 * 
	 * Returns true if the child (or children) was removed, or false if it was not in the display list.
	 * @param	child	The child to remove.
	 * @return	True if the child (or children) was removed, or false if it was not in the display list.
	 */
	@:overload(function(child1:DisplayObject, child2:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, child9:DisplayObject):Bool{})
	@:overload(function(child1:DisplayObject, child2:DisplayObject, child3:DisplayObject, child4:DisplayObject, child5:DisplayObject, child6:DisplayObject, child7:DisplayObject, child8:DisplayObject, child9:DisplayObject, child10:DisplayObject):Bool{})
	public function removeChild(child:DisplayObject):Bool;
	
	/**
	 * Removes the child at the specified index from the display list, and sets its parent to null.
	 * <code>container.removeChildAt(2);</code>
	 * 
	 * You can also remove multiple children:
	 * <code>container.removeChild(2, 7, ...)</code>
	 * 
	 * Returns true if the child (or children) was removed, or false if any index was out of range.
	 * @param	index	The index of the child to remove.
	 * @return	True if the child (or children) was removed, or false if any index was out of range.
	 */
	@:overload(function(index1:Int, index2:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int, index5:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int, index5:Int, index6:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int, index5:Int, index6:Int, index7:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int, index5:Int, index6:Int, index7:Int, index8:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int, index5:Int, index6:Int, index7:Int, index8:Int, index9:Int):Bool{})
	@:overload(function(index1:Int, index2:Int, index3:Int, index4:Int, index5:Int, index6:Int, index7:Int, index8:Int, index9:Int, index10:Int):Bool{})
	public function removeChildAt(index:Int):Bool;
	
	/**
	 * Changes the depth of the specified child.
	 * Fails silently if the child is not a child of this container, or the index is out of range.
	 * @param	child	Display object child.
	 * @param	index	New index for child.
	 */
	public function setChildIndex(child:DisplayObject, index:Int):Void;
	
	/**
	 * Performs an array sort operation on the child list.
	 * <b>Example: Display children with a higher y in front:</b><code>
	 * var sortFunction = function(child1, child2) {
	 *     if (child1.y > child2.y) { return 1; }
	 *     if (child1.y < child2.y) { return -1; }
	 *     return 0;
	 * }
	 * container.sortChildren(sortFunction);
	 * </code>
	 * @param	sortFunction	The function to use to sort the child list. See JavaScript's Array.sort documentation for details.
	 */
	public function sortChildren(sortFunction:DisplayObject->DisplayObject->Float):Void;
	
	/**
	 * Swaps the specified children's depth in the display list.
	 * Fails silently if either child is not a child of this Container.
	 * @param	child1	Display object child 1.
	 * @param	child2	Display object child 2.
	 */
	public function swapChildren(child1:DisplayObject, child2:DisplayObject):Void;
	
	/**
	 * Swaps the children at the specified indexes.
	 * Fails silently if either index is out of range.
	 * @param	index1	Index of child 1.
	 * @param	index2	Index of child 2.
	 */
	public function swapChildrenAt(index1:Int, index2:Int):Void;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Draws the display object into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context		The canvas 2D context object to draw into.
	 * @param	ignoreCache	Indicates whether the draw operation should ignore any current cache.
	 * 						For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @return	Returns true if the draw was handled (useful for overriding functionality).
	 */
	override public function draw(context:CanvasRenderingContext2D, ignoreCache:Bool = false):Bool;
	
	/**
	 * Tests whether the display object intersects the specified local point (ie. draws a pixel with alpha > 0 at the specified position).
	 * This ignores the alpha, shadow and compositeOperation of the display object, and all transform properties including regX/Y.
	 * @param	x	The x position to check in the display object's local coordinates.
	 * @param	y	The y position to check in the display object's local coordinates.
	 * @return	A Boolean indicating whether there is a visible section of a DisplayObject that overlaps the specified coordinates.
	 */
	override public function hitTest(x:Float, y:Float):Bool;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Returns a clone of this Container.
	 * Some properties that are specific to this instance's current context are reverted to their defaults (for example .parent).
	 * @param	recursive	If true, all of the descendants of this container will be cloned recursively.
	 * 						If false, the properties of the container will be cloned, but the new instance will not have any children.
	 * @return	A clone of the current Container instance.
	 */
	override public function clone(recursive:Bool = false):Container;
	
	/**
	 * Returns a string representation of this Container.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}