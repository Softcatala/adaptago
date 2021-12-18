package po

import (
	"errors"
	"github.com/leonelquinteros/gotext"
)

type PoWrapper struct {
	po *gotext.Po
}

const poId = "Exit"

func NewWrapper(f string) (*PoWrapper, error) {

	po := gotext.NewPo()
	po.ParseFile(f)

	if po.Get(poId) == poId {
		return nil, errors.New("Could not load template po file")
	}

	return &PoWrapper{po}, nil
}

type poCallback = func(po *gotext.Po) (*gotext.Po, error)

func (w *PoWrapper) Execute(t string, c poCallback) (string, error) {
	w.po.Set(poId, t)

	newPo, err := c(w.po)

	if err != nil {
		return "", err
	}

	o := newPo.Get(poId)

	return o, nil
}
