using Assets.Scripts;
using UnityEngine;

public class CharacterMoods : MonoBehaviour
{
    public CharacterName Name;

    public Sprite Neutral;
    public Sprite Angry;
    public Sprite Happy;
    public Sprite Worried;
    public Sprite Dramatic;
    public Sprite Threatening;
    public Sprite Vampire;
    public Sprite Cop;
    public Sprite Singing;

    public Sprite GetMoodSprite(CharacterMood mood)
    {
        switch (mood)
        {
            case CharacterMood.Neutral:
                return Neutral;
            case CharacterMood.Angry:
                return Angry ?? Neutral;
            case CharacterMood.Happy:
                return Happy ?? Neutral;
            case CharacterMood.Worried:
                return Worried ?? Neutral;
            case CharacterMood.Dramatic:
                return Dramatic ?? Neutral;
            case CharacterMood.Threatening:
                return Threatening ?? Neutral;
            case CharacterMood.Vampire:
                return Vampire ?? Neutral;
            case CharacterMood.Cop:
                return Cop ?? Neutral;
            case CharacterMood.Singing:
                return Singing ?? Neutral;
            default:
                Debug.Log($"Didn't find Sprite for character: {Name}, mood: {mood}");
                return Neutral;
        }
    }
}
