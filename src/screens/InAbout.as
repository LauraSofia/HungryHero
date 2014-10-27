package screens
{
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InAbout extends Sprite
	{
		private var bg:Image;
		
		private var backBtn:Button;
		
		public function InAbout()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawAbout();
		}
		
		private function drawAbout():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			backBtn = new Button(Assets.getAtlas().getTexture("about_backButton"));
			backBtn.x = 500;
			backBtn.y = 260;
			this.addChild(backBtn);
			
			this.addEventListener(Event.TRIGGERED, onBackClick);
		}
		
		private function onBackClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == backBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"back"}, true));
			}
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
	}
}