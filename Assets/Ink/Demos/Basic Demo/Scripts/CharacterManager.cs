using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using System.Linq;
using Assets.Scripts;

public class CharacterManager : MonoBehaviour
{
    private List<Character> _characters;

    [SerializeField]
    private GameObject _characterPrefab;

    [SerializeField]
    private CharacterMoods _doctorMoods;
    [SerializeField]
    private CharacterMoods _davidMoods;
    [SerializeField]
    private CharacterMoods _carmellaMoods;
    [SerializeField]
    private CharacterMoods _priscillaMoods;
    [SerializeField]
    private CharacterMoods _directorMoods;

    private void Awake()
    {
        _characters = new List<Character>();
        Debug.Log(_characters);
    }

    public void ShowCharacter(string name, string position, string mood)
    {
        if (!Enum.TryParse(name, out CharacterName nameEnum))
        {
            Debug.LogWarning($"Failed to parse character name to enum: {name}");
            return;
        }

        if (!Enum.TryParse(position, out CharacterPosition positionEnum))
        {
            Debug.LogWarning($"Failed to parse character position to enum: {position}");
            return;
        }

        if (!Enum.TryParse(mood, out CharacterMood moodEnum))
        {
            Debug.LogWarning($"Failed to parse character mood to enum: {mood}");
            return;
        }

        ShowCharacter(nameEnum, positionEnum, moodEnum);
    }

    public void ShowCharacter(CharacterName name, CharacterPosition position, CharacterMood mood)
    {
        var character = _characters.FirstOrDefault(x => x.Name == name);

        if (character == null)
        {
            var characterObject = Instantiate(_characterPrefab, gameObject.transform, false);
            character = characterObject.GetComponent<Character>();

            _characters.Add(character);
        }
        else if (character.IsShowing)
        {
            Debug.LogWarning($"Failed to show character {name}. Character already showing");
            return;
        }

        character.Init(name, position, mood, GetMoodSetForCharacter(name));
    }

    public void HideCharacter(string name)
    {
        if (!Enum.TryParse(name, out CharacterName nameEnum))
        {
            Debug.LogWarning($"Failed to parse character name to character enum: {name}");
            return;
        }

        HideCharacter(nameEnum);
    }

    public void HideCharacter(CharacterName name)
    {
        var character = _characters.FirstOrDefault(x => x.Name == name);

        if (character?.IsShowing != true)
        {
            Debug.LogWarning($"Character {name} is not currently shown. Can't hide it.");
            return;
        }
        else
        {
            character.Hide();
        }
    }
    public void ChangeMood(string name, string mood)
    {
        if (!Enum.TryParse(name, out CharacterName nameEnum))
        {
            Debug.LogWarning($"Failed to parse character name to character enum: {name}");
            return;
        }

        if (!Enum.TryParse(mood, out CharacterMood moodEnum))
        {
            Debug.LogWarning($"Failed to parse character mood to enum: {mood}");
            return;
        }

        ChangeMood(nameEnum, moodEnum);
    }

    public void ChangeMood(CharacterName name, CharacterMood mood)
    {
        var character = _characters.FirstOrDefault(x => x.Name == name);

        if (character?.IsShowing != true)
        {
            Debug.LogWarning($"Character {name} is not currently shown. Can't change the mood.");
            return;
        }
        else
        {
            character.ChangeMood(mood);
        }
    }

    private CharacterMoods GetMoodSetForCharacter(CharacterName name)
    {
        switch (name)
        {
            case CharacterName.Doctor:
                return _doctorMoods;
            case CharacterName.David:
                return _davidMoods;
            case CharacterName.Carmella:
                return _carmellaMoods;
            case CharacterName.Priscilla:
                return _priscillaMoods;
            case CharacterName.Director:
                return _directorMoods;
            default:
                Debug.LogError($"Could not find moodset for {name}");
                return null;
        }
    }
}
