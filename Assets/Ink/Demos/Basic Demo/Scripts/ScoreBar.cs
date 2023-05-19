using UnityEngine;
using UnityEngine.UI;
public class ScoreBar : MonoBehaviour
{
    public Image scoreBarImage;
    public float maxPoints = 50f;
    private SoundManager _sound;

    private void Start()
    {
        _sound = FindObjectOfType<SoundManager>();
    }
    public void UpdateScoreBar(float points, string direction)
    {
        Debug.Log(points);
        if(direction == "up")
        {
            _sound.PlaySound("SFX slide up");
        }
        else if(direction == "down")
        {
            _sound.PlaySound("SFX slide down");
        }
        scoreBarImage.fillAmount = Mathf.Clamp((points / maxPoints), 0, 1f);
    }
}