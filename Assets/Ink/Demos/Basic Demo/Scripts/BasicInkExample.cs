using UnityEngine;
using UnityEngine.UI;
using System;
using Ink.Runtime;
using Ink.Parsed;

// This is a super bare bones example of how to play and display a ink story in Unity.
public class BasicInkExample : MonoBehaviour {
    public static event Action<Ink.Runtime.Story> OnCreateStory;
    private CharacterManager _characterManager;
	private SoundManager _soundManager;
	public AudioSource _audiosource;
	private ScoreBar _score;

    void Awake () {
        // Remove the default message
        _characterManager = FindObjectOfType<CharacterManager>();
        _soundManager = FindObjectOfType<SoundManager>();
		_score = FindObjectOfType<ScoreBar>();
        RemoveChildren();
		StartStory();
	}

	// Creates a new Story object with the compiled story which we can then play!
	void StartStory () {
        GameObject background = Instantiate(backgroundPrefab) as GameObject;
		_audiosource.Play();
        story = new Ink.Runtime.Story(inkJSONAsset.text);
        if (OnCreateStory != null) OnCreateStory(story);
        story.BindExternalFunction("ShowCharacter",
            (string name, string position, string mood) => _characterManager.ShowCharacter(name, position, mood));

        story.BindExternalFunction("HideCharacter",
            (string name) => _characterManager.HideCharacter(name));

        story.BindExternalFunction("ChangeMood",
            (string name, string mood) => _characterManager.ChangeMood(name, mood));
		story.BindExternalFunction("PlaySound",
			(string soundname) => _soundManager.PlaySound(soundname));
        story.BindExternalFunction("UpdateScore",
            (string points, string direction) => _score.UpdateScoreBar(float.Parse(points), direction));

        RefreshView();
	}
	
	// This is the main function called every time the story changes. It does a few things:
	// Destroys all the old content and choices.
	// Continues over all the lines of text, then displays all the choices. If there are no choices, the story is finished!
	void RefreshView () {
		// Remove all the UI on screen
		RemoveChildren ();
		
		// Read all the content until we can't continue any more
		while (story.canContinue) {
			// Continue gets the next line of the story
			string text = story.Continue ();
			// This removes any white space from the text.
			text = text.Trim();
			// Display the text on screen!
			CreateContentView(text);
		}
		//if (story.currentTags.Count > 0)
		//{
		//	for (int i = 0; i < story.currentTags.Count; i++)
		//	{
		//		string tag = story.currentTags[i];
		//		Image img = CreatePortraitView(tag);
		//	}
		//}
		// Display all the choices, if there are any!
		if (story.currentChoices.Count > 0) {
			for (int i = 0; i < story.currentChoices.Count; i++) {
                Ink.Runtime.Choice choice = story.currentChoices [i];
				Button button = CreateChoiceView (choice.text.Trim ());
				// Tell the button what to do when we press it
				button.onClick.AddListener (delegate {
					OnClickChoiceButton (choice);
				});
			}
		}
		// If we've read all the content and there's no choices, the story is finished!
		else {
			Button choice = CreateChoiceView("End of story.\nRestart?");
			choice.onClick.AddListener(delegate{
				//RemovePortraits();
				_characterManager.HideCharacter("Doctor");
				_characterManager.HideCharacter("Director");
                _characterManager.HideCharacter("Carmella");
                _characterManager.HideCharacter("Priscilla");
                _characterManager.HideCharacter("David");
                _score.UpdateScoreBar(50f, "up");
				StartStory();
			});
		}
	}

	// When we click the choice button, tell the story to choose that choice!
	void OnClickChoiceButton (Ink.Runtime.Choice choice) {
		story.ChooseChoiceIndex (choice.index);
		RefreshView();
	}

	// Creates a textbox showing the the line of text
	void CreateContentView (string text) {
        UnityEngine.UI.Text storyText = Instantiate (textPrefab) as UnityEngine.UI.Text;
		storyText.text = text;
		storyText.transform.SetParent (panel1.transform, false);

	}
	//Image CreatePortraitView (string text)
	//{
	//	Image portrait = Instantiate(portraitPrefab) as Image;
	//	portrait.transform.SetParent(panel2.transform, false);
	//	portrait.sprite = Resources.Load<Sprite>(text);
	//	return portrait;
	//}

	// Creates a button showing the choice text
	Button CreateChoiceView (string text) {
		// Creates the button from a prefab
		Button choice = Instantiate (buttonPrefab) as Button;
		choice.transform.SetParent (panel1.transform, false);

        // Gets the text from the button prefab
        UnityEngine.UI.Text choiceText = choice.GetComponentInChildren<UnityEngine.UI.Text> ();
		choiceText.text = text;

		// Make the button expand to fit the text
		HorizontalLayoutGroup layoutGroup = choice.GetComponent <HorizontalLayoutGroup> ();
		layoutGroup.childForceExpandHeight = false;

		return choice;
	}

	// Destroys all the children of this gameobject (all the UI)
	void RemoveChildren () {
		int childCount = panel1.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i) {
			GameObject.Destroy (panel1.transform.GetChild (i).gameObject);
		}
        //int childCount2 = panel2.transform.childCount;
        //for (int i = childCount2 - 1; i >= 0; --i)
        //{
        //    GameObject.Destroy(panel2.transform.GetChild(i).gameObject);
        //}
    }
	//void RemovePortraits()
	//{
 //       int childCount2 = characterManager.transform.childCount;
 //       for (int i = childCount2 - 1; i >= 0; --i)
 //       {
 //          GameObject.Destroy(characterManager.transform.GetChild(i).gameObject);
 //       }

 //   }

    [SerializeField]
	private TextAsset inkJSONAsset = null;
	public Ink.Runtime.Story story;

	[SerializeField]
	private GameObject panel1 = null;
    [SerializeField]
    private GameObject characterManager = null;


    // UI Prefabs
    [SerializeField]
	private UnityEngine.UI.Text textPrefab = null;
	[SerializeField]
	private Button buttonPrefab = null;
    [SerializeField]
    private Image portraitPrefab = null;
    [SerializeField]
    private GameObject backgroundPrefab = null;
}
