package adapter

import (
	"errors"
)

type adapter struct {
	r sedRunner
}

func NewString(rex string) (*adapter, error) {
	r, err := newStringRunner(rex)

	if err != nil {
		return nil, err
	} else {
		return &adapter{r}, err
	}
}

func NewFile(rf string, rp string) (*adapter, error) {
	r, err := NewPoFileRunner(rf, rp)

	if err != nil {
		return nil, err
	} else {
		return &adapter{r}, err
	}
}

type Result struct {
	Original string
	Adapted  string
}

func (a *adapter) Adapt(i string) (*Result, error) {

	if i == "" {
		return &Result{Original: i}, errors.New("empty input")
	}

	o, err := a.r.run(i)

	if err != nil {
		return &Result{Original: i}, err
	}

	return &Result{Original: i, Adapted: o}, nil
}
