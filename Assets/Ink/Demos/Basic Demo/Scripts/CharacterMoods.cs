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
            default:
                Debug.Log($"Didn't find Sprite for character: {Name}, mood: {mood}");
                return Neutral;
        }
    }
}
