using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManager : MonoBehaviour
{
    public AudioSource _audio;
    public List<AudioClip> clips;
    private Dictionary<string, AudioClip> dict;

    public void Start()
    {
        dict = new Dictionary<string, AudioClip>();
        foreach(AudioClip x in clips)
        {
            dict.Add(x.name, x);
        }
    }
    public void PlaySound(string soundname)
    {
        _audio.PlayOneShot(dict[soundname], .7f);
    }
}
