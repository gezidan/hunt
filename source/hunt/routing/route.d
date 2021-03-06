﻿/*
 * Hunt - a framework for web and console application based on Collie using Dlang development
 *
 * Copyright (C) 2015-2017  Shanghai Putao Technology Co., Ltd
 *
 * Developer: HuntLabs
 *
 * Licensed under the Apache-2.0 License.
 *
 */

module hunt.routing.route;

import hunt.routing.define;

class Route
{
    this()
    {
        // Constructor code
    }

    public
    {
        Route copy()
        {
            Route route = new Route;

            route.setGroup(_group)
                .setUrlTemplate(_urlTemplate)
                .setRoute(_route)
                .setParamKeys(_paramKeys)
                .setPattern(_pattern)
                .setRegular(_regular)
                .setModule(_module)
                .setController(_controller)
                .setAction(_action)
                .setMethods(_methods)
                .handle(_handle);

            return route;
        }

        Route setGroup(string groupValue)
        {
            this._group = groupValue;
            return this;
        }

        string getGroup()
        {
            return this._group;
        }

        Route setUrlTemplate(string urlTemplate)
        {
            this._urlTemplate = urlTemplate;
            return this;
        }

        string getUrlTemplate()
        {
            return this._urlTemplate;
        }

        Route setRoute(string routeValue)
        {
            this._route = routeValue;
            return this;
        }

        string getRoute()
        {
            return this._route;
        }

        Route setParamKeys(string[int] paramKeys)
        {
            this._paramKeys = paramKeys;
            return this;
        }

        string[int] getParamKeys()
        {
            return this._paramKeys;
        }

        Route setParams(string[string] params)
        {
            this._params = params;
            return this;
        }

        string[string] getParams()
        {
            return this._params;
        }

        Route setPattern(string patternValue)
        {
            this._pattern = patternValue;
            return this;
        }

        string getPattern()
        {
            return this._pattern;
        }

        Route setRegular(bool regularValue)
        {
            this._regular = regularValue;
            return this;
        }

        bool getRegular()
        {
            return this._regular;
        }

        Route setModule(string moduleValue)
        {
            this._module = moduleValue;
            return this;
        }

        string getModule()
        {
            return this._module;
        }

        Route setController(string controllerValue)
        {
            this._controller = controllerValue;
            return this;
        }

        string getController()
        {
            return this._controller;
        }

        Route setAction(string actionValue)
        {
            this._action = actionValue;
            return this;
        }

        string getAction()
        {
            return this._action;
        }

        Route setMethods(HTTP_METHOS[] methods)
        {
            this._methods = methods;
            return this;
        }

        HTTP_METHOS[] getMethods()
        {
            return this._methods;
        }

        @property handle()
        {
            return this._handle;
        }

        @property Route handle(HandleFunction handle)
        {
            this._handle = handle;
            return this;
        }
                
        @property staticFilePath()
        {
        	return this._staticFilePath;
        }
        
        @property void staticFilePath(string path)
        {
        	this._staticFilePath = path;
        }
    }

    private
    {
        // Route group name
        string _group;

        // Regex template
        string _urlTemplate;

        // http uri params
        string[int] _paramKeys;

        string[string] _params;

        // like uri path
        string _pattern;

        // path to module.controller.action
        string _route;

        // use regex?
        bool _regular;

        // hunt module
        string _module;

        // hunt controller
        string _controller;

        // hunt action
        string _action;

        // handle function
        HandleFunction _handle;

        // allowd http methods
        HTTP_METHOS[] _methods = [ HTTP_METHOS.GET, HTTP_METHOS.POST, HTTP_METHOS.PUT, HTTP_METHOS.DELETE ];
        
        // staticDir:path
        string _staticFilePath;
    }
}
