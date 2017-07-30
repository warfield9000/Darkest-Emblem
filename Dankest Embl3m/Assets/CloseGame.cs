﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CloseGame : MonoBehaviour
{
    Button thisButton;

    private void Start()
    {
        thisButton = GetComponent<Button>();
        thisButton.onClick.AddListener(Click);
    }

    void Click()
    {
        Application.Quit();
        print("Quit Clicked");
    }
}
