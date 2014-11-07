package screens
{
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class InAbout extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		
		private var backBtn:Button;
		
		private var hsLogo:Image;
		private var sLogo:Image;
		
		private var text:TextField;
		
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
			
			hsLogo = new Image(Assets.getAtlas().getTexture("about_hsharmaLogo"));
			hsLogo.x = 30;
			hsLogo.y = 390;
			this.addChild(hsLogo);
			
			sLogo = new Image(Assets.getAtlas().getTexture("about_starlingLogo"));
			sLogo.x = 280;
			sLogo.y = 390;
			this.addChild(sLogo);
			
			title = new Image(Assets.getAtlas().getTexture("welcome_title"));
			title.x = 440;
			title.y = 20;
			this.addChild(title);
			
			text = new TextField(450, 450, "Tämä peli on koottu\nHemanth Sharman opetusvideon avulla.\nHän on suunnitellut pelin\nja tehnyt sen grafiikat.\nVideon avulla tein tähän peliin koodit.\n\nLaura", "Arial", 12);
			this.addChild(text);
			
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